require_relative 'common_steps'

module SearchSteps
  include CommonSteps

  def search_for(query)
    create(:department, title: "HMRC")
    ensure_on "/contacts/hmrc/search"

    within(dom_id_selector(SearchForm.new)) do
      fill_in 'search-main', with: query
      click_button 'Search'
    end
  end

  def search_result_exists(expected_result)
    within(search_result_list_selector) do
      page.has_content? expected_result
    end
  end

  def search_result_list_selector
    'ul.results-list'
  end
end
