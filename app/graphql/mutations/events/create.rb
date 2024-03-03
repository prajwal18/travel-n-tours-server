module Mutations
  module Events
    class CreateEventPayload < Types::BaseObject
      field :event, Types::EventType, null: true
      field :error, [String], null: true
    end

    class Create < GraphQL::Schema::Mutation
      argument :name, String, required: true
      argument :description, String, required: true
      argument :place_id, ID, required: true
      argument :banner, ApolloUploadServer::Upload, required: false
      argument :pictures, [ApolloUploadServer::Upload], required: false

      type CreateEventPayload

      def resolve(name:, description:, place_id:, banner: nil, pictures: nil)
        event = Event.new(name:, description:, place_id:)

        if banner
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
        if event.save
          { event: }
        else
          { error: event.errors.full_message }
        end
      end
    end
  end
end
