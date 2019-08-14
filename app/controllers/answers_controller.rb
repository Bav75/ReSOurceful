class AnswersController < ApplicationController

    def show_answer
        # binding.pry
        # find the answer selected in the dropwdown menu
        answer = Answer.find_by(id: params[:search][:answer_id])

        # redirect to the Stack Overflow page
        redirect_to "#{answer.post_link + "/" + answer.accepted_answer_id.to_s + "#" + answer.accepted_answer_id.to_s}"
    end

end