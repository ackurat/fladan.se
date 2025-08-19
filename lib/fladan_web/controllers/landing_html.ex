defmodule FladanWeb.LandingHTML do
  @moduledoc """
  This module contains pages rendered by LandingController.

  See the `landing_html` directory for all templates available.
  """
  use FladanWeb, :html

  embed_templates "landing_html/*"
end
