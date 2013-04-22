# In order for the application.manifest to work on the offline capable page, we cannot have rails
# add the cache busting timestamp because we can't pass that to rack offline which creates the application.manifest
# so for offline we set our own cache busting datestamp that we also set in rack-offline so the manifest will match the
# assets in the page
# for all other pages utilize regular rails cache busting time stamp
# kdh

require 'action_view/helpers/asset_tag_helper'

module ActionView
  module Helpers
    module AssetTagHelper
      def rewrite_asset_path(source, path = nil)
        if path && path.respond_to?(:call)
         return path.call(source)
        elsif path && path.is_a?(String)
         return path % [source]
        end
        asset_id = rails_asset_id(source)
        # on offline page add our own cache busting timestamp
        if controller.action_name == "offline"
          cache_buster_timestamp = "20120429"
          source + "?" + cache_buster_timestamp
        elsif asset_id.blank?
         source
        else
         source + "?#{asset_id}"
        end
      end
    end
  end
end