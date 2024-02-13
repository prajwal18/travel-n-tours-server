module Mutations
  module Events
    class Create < GraphQL::Schema::Mutation
      # argument :name, String, required: true
      # argument :description, String, required: true
      # argument :place_id, ID, required: true
      # argument :images, ApolloUploadServer::Upload, required: true

      argument :data, Types::InputObjects::Events::EventInput, required: true


      type Types::EventType

      def resolve(data:)
        # file = input[:images]
        # blob = ActiveStorage::Blob.create_and_upload!(
        #   io: file,
        #   filename: file.original_filename,
        #   content_type: file.content_type
        # )
        Event.create(name: data[:name], description: data[:description], place_id: data[:place_id])
      end
    end
  end
end
