module Mutations
  module Places
    class CreatePlacePayload < Types::BaseObject
      field :place, Types::PlaceType, null: true
      field :error, [String], null: true
    end

    class Create < GraphQL::Schema::Mutation
      argument :name, String, required: true
      argument :description, String, required: true
      argument :banner, ApolloUploadServer::Upload, required: false
      argument :pictures, [ApolloUploadServer::Upload], required: false

      type CreatePlacePayload

      def resolve(name:, description:, banner: nil, pictures: nil)
        place = Place.new(name:, description:)

        if banner
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
        if place.save
          { place: }
        else
          { error: place.errors.full_message }
        end
      end
    end
  end
end
