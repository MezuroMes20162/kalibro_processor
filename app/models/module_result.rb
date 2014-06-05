class ModuleResult < ActiveRecord::Base
  has_one :kalibro_module
  has_many :children, foreign_key: 'parent_id', class_name: 'ModuleResult'
  has_many :metric_results
  belongs_to :parent, class_name: 'ModuleResult'

  def metric_result_for(metric)
    metric_results.each {|metric_result| return metric_result if metric_result.metric == metric}
    return nil
  end
end