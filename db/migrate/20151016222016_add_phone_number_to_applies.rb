class AddPhoneNumberToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :phone, :string
  end
end
