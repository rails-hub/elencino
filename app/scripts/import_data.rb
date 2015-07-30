require 'rubygems'
require 'roo'

class ImportData

  class AsyncJob
    include SuckerPunch::Job

    def perform(form)
      form.import
    end

    def perform_map(form, import, mapping, accountable)
      form.read_members_url(import, mapping, accountable)
    end
  end

  def initialize(file, phase)
    @phase = phase
    @file = file
    @results = []
  end

  def submit
    AsyncJob.new.async.perform(self)
  end

  def import
    spreadsheet = open_spreadsheet(@file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      block = Block.where("block_number = ? and phase_id = ?", row['MZ'].to_i, @phase.id).first || Block.new
      block.block_number = row["MZ"].to_i
      block.phase_id = @phase.id
      block.save
      lot = Lot.where("lot_number = ? and block_id = ?", row['LOTE'].to_i, block.id).first || Lot.new
      lot.lot_number = row["LOTE"].to_i
      lot.block_id = block.id
      lot.area = row["M2"]
      lot.street = row["CALLE"]
      lot.price = row["PRECIO"]
      lot.total = row["TOTAL"]
      lot.save
    end
  end

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.xls' then
        Roo::Excel.new(file.path, packed: false,
                       file_warning: :ignore)
      when '.xlsx' then
        Roo::Excelx.new(file.path, packed: false,
                        file_warning: :ignore)
      else
        raise "Unknown file type: #{file.original_filename}"
    end
  end

end