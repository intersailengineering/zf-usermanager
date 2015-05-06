module Intersail
  module ZfUserManager
    module ApplicationHelper

      #### APPLICATION

      def get_search_param(param)
        @search_params[param] if @search_params.has_key?(param)
      end

      def search_params_for_url
        unless @search_params.blank?
          string = '?'
          @search_params.each do |k, v|
            string += "#{k.to_s}=#{v.to_s}&"
          end

          return string.slice(0, string.size - 1)
        end

        return ''
      end

      def user_selected(user)
        return '' unless defined?(@user) && !@user.blank?
        user.id.to_i == @user.id.to_i ? 'zum_viewer_row_selected' : ''
      end

      def enable_icon(enabled)
        if enabled
          content_tag :span, '', class: 'glyphicon glyphicon-ok zum_enabled_icon'
        else
          content_tag :span, '', class: 'glyphicon glyphicon-ban-circle zum_disabled_icon'
        end
      end

      def profile_data(urr)
        {urr_id: urr.id, unit: {id: urr.unit.id, name: urr.unit.name}, role: {id: urr.role.id, name: urr.role.name}}.to_json
      end



      #### MESSAGES

      def render_messages(messages_options=nil)
        if messages_options
          render 'intersail/zf_user_manager/partials/render_messages', render_messages_options: messages_options
        else
          render 'intersail/zf_user_manager/partials/render_messages', render_messages_options: @render_messages_options if @render_messages_options
        end
      end



      #### LAYOUT

      def clear
        content_tag(:div, '', class: 'clearfix')
      end

      def sp(n = 1)
        ('&nbsp;' * n).html_safe
      end



      #### MISC

      def time_hash
        Time.now.hash.abs
      end

    end
  end
end