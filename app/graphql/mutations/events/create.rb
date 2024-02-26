module Mutations
  module Events
    class Create < GraphQL::Schema::Mutation
      argument :name, String, required: true
      argument :description, String, required: true
      argument :place_id, ID, required: true
      argument :banner, ApolloUploadServer::Upload, required: false
      argument :pictures, [ApolloUploadServer::Upload], required: false

      field :event, Types::EventType, null: true
      field :error, [String], null: true

      def resolve(name:, description:, place_id:, banner: nil, pictures: nil)
        event = Event.new(name:, description:, place_id:)

        puts "\n\n Hello Hello"
        puts event
        puts "\n\n Hello Hello"

        if banner
          banner_blob = ActiveStorage::Blob.create_and_upload!(
            io: banner,
            filename: banner.original_filename,
            content_type: banner.content_type
          )
          event.banner = banner_blob
          # event.banner.attach(banner)
        end
        if pictures && !pictures.empty?
          pictures.each do |_picture|
            pictures_blob = ActiveStorage::Blob.create_and_upload!(
              io: picture,
              filename: picture.original_filename,
              content_type: picture.content_type
            )
            event.pictures = pictures_blob
            # event.pictures.attach(picture)
          end
        end
        if event.save
          puts "\n"
          puts event
          puts "\n"
          { event: }
        else
          { error: event.errors.full_message }
        end
      end
    end
  end
end
