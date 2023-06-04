require 'csv'

module DownloaderHelper
  def generate_csv(headers, libraries)
    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << ['Library Name', 'Library Year of Creation', 'Library City', 'Library Street', 'Library ZIP Code',
              'User Name', 'User Email', 'Library Card Number']

      libraries.each do |library|
        library.library_cards.each do |library_card|
          user = library_card.user
          csv << [
              library.name,
              library.year_of_creation,
              library.city,
              library.street,
              library.zip_code,
              user.name,
              user.email,
              library_card.id
          ]
        end
      end
    end
  end

  def generate_pdf(libraries)
    pdf = Prawn::Document.new
    data = []
    libraries.each do |library|
      library_data = {}
      library_data[:library_name] = library.name
      library_data[:library_year_of_creation] = library.year_of_creation
      library_data[:library_city] = library.city
      library_data[:library_street] = library.street
      library_data[:library_zip_code] = library.zip_code
      data << library_data

      library.library_cards.each do |library_card|
        user = library_card.user
        user_data = {}
        user_data[:user_name] = user.name
        user_data[:user_email] = user.email
        user_data[:library_card_number] = user_card.id
        data << user_data
      end
    end

    pdf.text "Libraries\n\n"
    data.each do |data_entry|
      if data_entry[:library_name]
        pdf.text "_______________________________________________________________________________"
        pdf.text "Library Name: #{data_entry[:library_name].encode("windows-1252", invalid: :replace, undef: :replace)}"
        pdf.text "Library Year of Creation: #{data_entry[:library_year_of_creation]}"
        pdf.text "Library City: #{data_entry[:library_city]}"
        pdf.text "Library Street: #{data_entry[:library_street]}"
        pdf.text "Library ZIP Code: #{data_entry[:library_zip_code]}"
        pdf.text "\n"
        pdf.text "Readers:"
        pdf.text "\n"
      else
        pdf.text "Reader Name: #{data_entry[:user_name]}"
        pdf.text "Reader Email: #{data_entry[:user_email]}"
        pdf.text "Reader Card Number: #{data_entry[:library_card_number]}"
        pdf.text "\n"
      end
    end
    pdf.render
  end

  def generate_library_report(library)
    Prawn::Document.new do |pdf|
      pdf.text "Library Information", size: 16, style: :bold, align: :center, color: "0072C6"
      pdf.move_down 20
      pdf.image "#{Rails.root}/app/assets/images/library.jpg", width: 400, align: :center
      pdf.move_down 20

      pdf.text "Library Name: #{library.name.encode("windows-1252", invalid: :replace, undef: :replace)}", size: 14, color: "333333"
      pdf.text "Year of Creation: #{library.year_of_creation}", size: 14, color: "333333"
      pdf.text "City: #{library.city}", size: 14, color: "333333"
      pdf.text "Street: #{library.street}", size: 14, color: "333333"
      pdf.text "ZIP Code: #{library.zip_code}", size: 14, color: "333333"
      pdf.text "_______________________________________________________________________________", color: "5cff00"
      pdf.move_down 20

      pdf.text "Books in the Library", size: 16, style: :bold, color: "ff2400"
      pdf.move_down 10

      library.books.each do |book|
        pdf.text "Title: #{book.name}"
        pdf.text "Authors: #{book.authors.map(&:name).join(", ")}"
        pdf.text "Genres: #{book.genres.map(&:name).join(", ")}"
        pdf.text "Published_date: #{book.year}"
        pdf.text "\n"
      end
      pdf.text "_______________________________________________________________________________", color: "5cff00"
      pdf.move_down 20

      pdf.text "Readers in the Library", size: 16, style: :bold, color: "700357"
      pdf.move_down 10

      library.library_cards.each do |library_card|
        user = library_card.user
        pdf.text "Name: #{user.name}"
        pdf.text "Email: #{user.email}"
        pdf.text "Card Number: #{library_card.id}"
        pdf.text "\n"
      end
    end.render
  end

  def generate_user_report(user)
    pdf = Prawn::Document.new
    pdf.text "User Information", size: 16, style: :bold, align: :center, color: "0072C6"
    pdf.move_down 20

    pdf.text "Name: #{user.name}"
    pdf.text "Email: #{user.email}"

    library_card = user.library_card
    if library_card
      pdf.move_down 20
      pdf.text "Library Card", size: 14, style: :bold, color: "ff2400"
      pdf.move_down 10
      pdf.text "Card Number: #{library_card.id}"
      pdf.text "Library: #{library_card.library.name}"
      pdf.text "Books:"
      library_card.books.each do |book|
        pdf.text "- #{book.name} (#{book.year})"
      end
    end
    pdf.render
  end
end
