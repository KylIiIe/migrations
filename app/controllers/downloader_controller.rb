class DownloaderController < ApplicationController
  def csv
    @libraries = Library.all.includes(:library_cards => :user)
    headers['Content-Disposition'] = "attachment; filename=\"readers_and_libraries.csv\""
    headers['Content-Type'] ||= 'text/csv'
    csv_data = helpers.generate_csv(headers, @libraries)
    render plain: csv_data
  end

  def pdf
    @libraries = Library.all.includes(:library_cards => :user)
    send_data helpers.generate_pdf(@libraries), filename: "libraries.pdf", type: "application/pdf", disposition: "attachment"
  end

  def pdf_library
    library = Library.find(params[:id])
    send_data helpers.generate_library_report(library), filename: "#{library.name}.pdf", type: "application/pdf"
  end

  def pdf_user
    user = User.find(params[:id])
    send_data helpers.generate_user_report(user), filename: "user_report_#{user.name}.pdf", type: 'application/pdf'
  end
end
