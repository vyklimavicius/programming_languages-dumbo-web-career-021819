# languages = {
#   :oo => {
#     :ruby => {
#       :type => "interpreted"
#     },
#     :javascript => {
#       :type => "interpreted"
#     },
#     :python => {
#       :type => "interpreted"
#     },
#     :java => {
#       :type => "compiled"
#     }
#   },
#   :functional => {
#     :clojure => {
#       :type => "compiled"
#     },
#     :erlang => {
#       :type => "compiled"
#     },
#     :scala => {
#       :type => "compiled"
#     },
#     :javascript => {
#       :type => "interpreted"
#     }
#
#   }
# }

# def reformat_languages(languages)
#     new_hash = Hash.new
#     languages.select do |key,value|
#       value.select do |key2,value2|
#           new_hash[key2] = value2
#           value2[:style] = []
#         value2.select do |key3,value3|
#           if key == :oo
#            if key3 == :style
#               value3 << key
#            end
#           elsif key == :functional
#             if key3 == :style
#               value3 << key
#             end
#           end
#         end
#       end
#     end
#     new_hash
#   end

def reformat_languages(languages)
    new_hash = Hash.new
    languages.select do |key,value|
      value.select do |key2,value2|
          new_hash[key2] = value2
          value2[:style] = []
        value2.select do |key3,value3|
          if key == :oo
           if key3 == :style
              value3 << key
           end
          elsif key == :functional
            if key3 == :style
              value3 << key
            end
          end
        end
      end
    end
    new_hash.select do |key,value|
      if key == :javascript
        value.select do |key2,value2|
          if key2 == :style
            value2.unshift(:oo)
          end
        end
      end
    end
    new_hash
  end
