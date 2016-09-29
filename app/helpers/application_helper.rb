module ApplicationHelper
  # Render a form_for tag pointing to the update action of the current
  # controller, with a hidden field for any 'next_step' that was passed in
  def step_form(record, options = {}, &block)
    opts = {
      url: { controller: controller.controller_path, action: :update },
      method: :put,
      as: :form_object
    }.merge(options)

    form_for record, opts do |f|
      hidden_field_tag(:next_step, @next_step) + capture { yield f }
    end
  end

  # Helper method to enable redirecting/linking to a specific step (node) in the
  # decision tree
  def step_path(step, object, opts = {})
    params = {
      # TODO: remove hard-coded 'localhost:3000' - use request.host_with_port instead
      host: "localhost:3000",
      action: :edit,
      controller: ["steps/", step].join,
      id: object
    }.merge opts

    url_for params
  end
end
