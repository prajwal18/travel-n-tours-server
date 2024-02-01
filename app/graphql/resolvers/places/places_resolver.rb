module Resolvers
  module Places
    class PlacesResolver < BaseResolver
      type [Types::PlaceType], null: false
      def resolve
        Place.all
      end
    end
  end
end
