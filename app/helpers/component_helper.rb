module ComponentHelper

  def get_total_component_cost
    @components.sum(:cost)
  end
  
end
