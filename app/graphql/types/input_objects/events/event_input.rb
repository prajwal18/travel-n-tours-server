module Types
  module InputObjects
    module Events
      class EventInput  < InputObjects::BaseInput
        description 'Default Event Input'
        argument :name, String, required: true
        argument :description, String, required: true
        argument :place_id, ID, required: true
        # argument :images, ApolloUploadServer::Upload, required: true
      end
    end
  end
end
