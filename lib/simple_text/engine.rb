module SimpleText
  class Engine < ::Rails::Engine
    initializer "simple_text.load_helpers" do |app|
      ActionController::Base.send :include, SimpleText::ApplicationHelper
    end
  end
end
