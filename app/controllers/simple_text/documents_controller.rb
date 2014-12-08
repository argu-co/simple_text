module SimpleText
  class DocumentsController < ApplicationController

    def index
      @documents = Document.all.page params[:page]
    end

    def show
      @document = Document.where(name: params[:name]).first || not_found

      unless fresh_when(etag: @document, last_modified: @document.created_at, public: true)
        render
      end
    end

    def new
      @document = Document.new
    end

    def create
      @document = Document.create create_params

      respond_to do |format|
        if @document.save
          create_edit_entry @document, :a_create
          format.html { redirect_to documents_path, notice: t('simple_text.created') }
        else
          format.html { render new_document_path, notice: t('simple_text.error') }
        end
      end
    end

    def edit
      @document = Document.where(name: params[:id]).first || not_found
    end

    def update
      @document = Document.where(name: params[:document][:name]).first || not_found
      _old_doc = @document.clone
      respond_to do |format|
        if @document.update permit_params
          create_edit_entry @document, :a_update, _old_doc.as_json.to_s
          format.html { redirect_to documents_path, notice: t('simple_text.succeeded') }
        else
          format.html { render 'edit' }
        end
      end
    end

    private

    def permit_params
      params.require(:document).permit(:title, :contents)
    end

    def create_params
      params.require(:document).permit(:name, :title, :contents)
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

  end
end