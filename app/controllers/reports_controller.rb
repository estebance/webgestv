class ReportsController < ApplicationController
  

  def index
  @dia = params[:dia]
  @historicos = Hst.all
  @parser = Chronic.parse('today')  #
  @parserb = Chronic.parse(@dia)
  @integro = @parser.to_i
  @integrob = @parserb.to_i
  #@historicosdia = Hst.find_by(created_at: @integro)
  @historicosb = Hst.all.or(:tstamp.lte => @integrob)

  end


end
