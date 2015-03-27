class EmberController < ApplicationController
  def bootstrap
    render layout: 'ember_application'
  end
end