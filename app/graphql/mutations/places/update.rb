module Mutations
  module Places
    class Update < GraphQL::Schema::Mutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
      argument :banner, ApolloUploadServer::Upload, required: false
      argument :pictures, [ApolloUploadServer::Upload], required: false

      type Types::PlaceType

      def resolve(id:, name: nil, description: nil, banner: nil, pictures: nil)
        place = Place.find(id)

        place.name = name if name
        place.description = description if description

        if banner 
          place.banner.purge
          banner_blob = ActiveStorage::Blob.create_and_upload!(
            io: banner,
            filename: banner.original_filename,
            content_type: banner.content_type
          )
          place.banner = banner_blob
        end

        if pictures && !pictures.empty?
          pictures.each do |picture|
            place.pictures.attach(
              io: picture,
              filename: picture.original_filename,
              content_type: picture.content_type
            )
          end
        end

        place.save
        place
      end
    end
  end
end
