class WorkPoint < ActiveRecord::Base
  belongs_to :user

  def self.filter(user_id)
    work_points = WorkPoint.where( user_id: user_id )
    work_points = work_points.where("EXTRACT(MONTH FROM entrada) = ?", Time.zone.now.month)
    work_points
  end

  def total
    horario_de_almoco = volta_almoco - almoco
    horas = saida - entrada
    total = horas - horario_de_almoco
    total
  end

  def total_convertido
    horas = converte_segundos_to_horas(total)
    horas
  end

  private
    def converte_segundos_to_horas(seconds)
      hours = Time.at(seconds).gmtime.strftime('%R:%S')
      hours
    end
end
