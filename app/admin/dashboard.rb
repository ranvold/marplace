# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: 'custom-chart-1' do
      h3 'Dealers and the number of their cars:'
      @dealers_cars = Dealer.all.map do |dealer|
        { name: dealer.name, data: Car.where(dealer_id: dealer.id).group(:dealer_id).count }
      end

      render partial: 'statistics/dealers_by_cars', locals: {dealers_cars: @dealers_cars}
    end
    div class: 'custom-chart-2' do
      h3 'Number of cars by name:'
      @cars = Car.group(:name).count

      render partial: 'statistics/cars_by_name', locals: {cars: @cars}
    end
  end
end
