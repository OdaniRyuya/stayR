class Reservation < ApplicationRecord
  belongs_to :room , optional: true

  #validate :start_end_check #終了日時が開始日時より遅い日時かチェック
  #validate :start_check #開始日時が現在の時間より遅い日時かチェック
#
  #def start_check
  #if start_day.present? && start_day > Time.current
  #  errors.add(:start_day, "は現在の日時より遅い時間を選択してください。")
  #end
#
  #end
  #def start_end_check
  #  if start_day.present? && end_day.present? && start_day < end_day
  #    errors.add(:end_day, "は開始日時より遅い時間を選択してください。")
  #  end
  #end

end
