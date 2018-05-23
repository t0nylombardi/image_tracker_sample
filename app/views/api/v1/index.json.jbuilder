json.campaign do
  json.array! @list  
end

#json.campaign @campaign, partial: 'api/v1/show', as: :campaign
#json.total_count @campaign.respond_to?(:total_entries) ? @campaign.total_entries : @campaign.to_a.count
