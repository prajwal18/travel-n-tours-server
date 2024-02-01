module Resolvers
  module Places
    class PlaceResolver < BaseResolver
      type Types::PlaceType, null: false
      argument :id, ID, required: true

      def resolve(id:)
        Place.find(id)
      end
    end
  end
end
