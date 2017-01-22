module IncomeHelper

  def get_total_income
    @incomes.sum(:amount)
  end
end
