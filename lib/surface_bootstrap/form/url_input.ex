defmodule SurfaceBootstrap.Form.UrlInput do
  @moduledoc """
  The url input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#url_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/url
  """

  use Surface.Component
  use SurfaceBootstrap.Form.TextInputBase

  alias Surface.Components.Form.UrlInput

  @doc "Max length of field, as enforced by client browser. Not validated by Elixir."
  prop maxlength, :integer

  @doc "Minimum length of field, as enforced by client browser. Not validated by Elixir."
  prop minlength, :integer

  def render(assigns) do
    ~H"""
    <FieldContext name={{ @field }}>
      {{ raw(optional_div(assigns)) }}
      <Label :if={{ @label && !@in_group && !@floating_label }} class="form-label">{{ @label }}</Label>
      <UrlInput
        class={{ input_classes(assigns) ++ @class }}
        field={{ @field }}
        value={{ @value }}
        :props={{ default_surface_input_props(assigns) }}
        opts={{ default_core_input_opts(assigns) ++ @opts }}
      />
      <Label :if={{ @label && !@in_group && @floating_label }} class="form-label">{{ @label }}</Label>
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
      {{ help_text(assigns) }}
      <#Raw :if={{ !@in_group }}></div></#Raw>
    </FieldContext>
    """
  end
end
