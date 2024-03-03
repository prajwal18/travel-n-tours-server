module Mutations
  module Events
    class Update < GraphQL::Schema::Mutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
      argument :place_id, ID, required: false
      argument :banner, ApolloUploadServer::Upload, required: false
      argument :pictures, [ApolloUploadServer::Upload], required: false

      type Types::EventType

      def resolve(id:, description: nil, place_id: nil, name: nil, banner: nil, pictures: nil)
        event = Event.find(id)

        event.name = name if name
        event.description = description if description
        event.place_id = place_id if place_id

        if banner 
          event.banner.purge
          banner_blob = ActiveStorage::Blob.create_and_upload!(
            io: banner,
            filename: banner.original_filename,
            content_type: banner.content_type
          )
          event.banner = banner_blob
        end

        if pictures && !pictures.empty?
          pictures.each do |picture|
            event.pictures.attach(
              io: picture,
              filename: picture.original_filename,
              content_type: picture.content_type
            )
          end
        end

        event.save
        event
      end
    end
  end
end
