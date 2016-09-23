module ApplicationHelper
  def step_path(step, object, opts = {})
    # TODO: remove hard-coded 'localhost:3000' - use request.host_with_port instead
    url_for host: "localhost:3000", action: :edit, controller: ["steps/", step].join, id: object
  end
end
