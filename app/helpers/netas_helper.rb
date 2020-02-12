module NetasHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_netas_path
    elsif action_name == 'edit'
      neta_path
    end
  end
end
