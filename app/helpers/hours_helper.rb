module HoursHelper
  def total_do_mes(work_points)
    total = 0
    work_points.each do |work_point|
      total = total + work_point.total
    end
    converte_segundos_to_horas(total)
  end
  def converte_segundos_to_horas(seconds)
    horas = (seconds.div(3600))
    minutos = Integer(calcula_minutos(seconds) * 60)
    total = horas.to_s << ':' << minutos.to_s
    total
  end

  def calcula_minutos(seconds)
    minutos = Integer(seconds / 3600)
    minutos_dec = (seconds / 3600)
    minutos_dec = minutos_dec - minutos
  end
end
