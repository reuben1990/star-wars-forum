class StoresController < ApplicationController
  def index
    redirect_to "https://www.paypal.com/c2/cgi-bin/webscr?cmd=_login-run"
  end
end
