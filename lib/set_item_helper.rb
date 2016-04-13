

class SetItemHelper

  def create_set_item(params, set_list_id)
    binding.pry
    (1..4).each do |set|
      (1..10).each do |song|
        key_match = "#{set},#{song}"
        params.each do |k,v|
          if k == key_match
            SetItem.create(order: song, set: set, song_id: params[key_match], set_list_id: set_list_id)
          end
        end
      end
    end
  end

end
