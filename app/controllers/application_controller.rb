# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # Help action - it doesnt realy belong anywhere, so...
  def textile_help
    @list_example = %{
* prvni polozka
* druha polozka
** treti, vnorena polozka

# cislovana polozka
#* vnorena polozka, ale ne cislovana
# druha cislovana polozka
}

    @emphasis_example = %{
Text který chcete zvýraznit napište mezi *hvězdičky* nebo _podtržítka_.

*duležité, tedy tučné a upoutávající pozornost při pohledu na text*
_kurzíva, upoutávající pozornost při čtení_
}


    @links_example = %{
Odkaz se píše v uvozovkách a kam se uživatel dostane za dvojtečku za uvozovky.
"Toto bude text odkazu":http://example.com
}

    render 'shared/textile_help'
  end
end

