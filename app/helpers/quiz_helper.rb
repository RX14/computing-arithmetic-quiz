# Helper methods defined here can be accessed in any controller or view in the application

module ComputingArithmeticQuiz
    class App
        module QuizHelper
            class Question
                def initialize(arg1, arg2 = nil, arg3 = nil)
                    if arg1.class == Hash
                        init_rand(arg1)
                    else
                        init_pre(arg1, arg2, arg3)
                    end
                end

                def init_rand(options = {})
                    @options = { min: 1, max: 10, operators: [:*, :+, :-] }.merge options

                    @left = rand_from_options
                    @operator = @options[:operators].sample
                    @right = rand_from_options

                    @result = do_sum
                end

                def init_pre(left, operator, right)
                    @left = left.to_i
                    @operator = operator.to_sym
                    @right = right.to_i
                    @result = do_sum
                end

                attr_reader :left
                attr_reader :operator
                attr_reader :right
                attr_reader :result
                attr_reader :options

                def rand_from_options
                    rand(@options[:min]..@options[:max])
                end

                def to_s
                    "#{left} #{operator} #{right}"
                end

                def show
                    "#{self} = #{result}"
                end

                def inspect
                    "#<Question #{show}>"
                end

                def do_sum
                    case @operator
                        when :+
                            @left + @right
                        when :-
                            @left - @right
                        when :*
                            @left * @right
                        when :/
                            @left / @right
                    end
                end

                private :do_sum

                def self.get(amount, options = {})
                    (1..amount).collect { new(options) }
                end

                def self.read(string) # rubocop:disable Metrics/MethodLength
                    case
                        when string.include?("+")
                            val = string.split("+")
                            op = :+
                        when string.include?("-")
                            val = string.split("-")
                            op = :-
                        when string.include?("*")
                            val = string.split("*")
                            op = :*
                        when string.include?("/")
                            val = string.split("/")
                            op = :/
                    end

                    new(val[0], op, val[1])
                end
            end
        end

        $Question = ::ComputingArithmeticQuiz::App::QuizHelper::Question
        helpers QuizHelper
    end
end
