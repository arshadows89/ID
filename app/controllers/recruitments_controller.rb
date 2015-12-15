class RecruitmentsController < ApplicationController
  def edit_multiple
    @recruitment = Recruitment.find(params[:recruitment_ids])
  end

  def update_multiple
    if params[:recruitment_ids].present? == false
      Recruitment.update_all(:recruiting => false)
    else
      Recruitment.update_all(:recruiting => false)
      @recruitments = Recruitment.find(params[:recruitment_ids])
      @recruitments.reject! do |recruitment|
        recruitment.update_attributes(:recruiting => true)
      end
    end
    redirect_to admin_recruitment_path, notice: "Recruitment Icons Updated."
  end

end
