module ApplicationHelper
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
