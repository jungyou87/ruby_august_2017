class StudentsController < ApplicationController
    def new
        @dojos = Dojo.all
        @dojo = Dojo.find(params[:dojo_id])
        flash[:message] ||= []
        return render 'students/new.html.erb'
    end

    def create
        @dojo = Dojo.find(params[:dojo_id])
        flash[:message] ||= []
        @student = Student.create(student_params)
        p @student
        if  @student.errors.full_messages != [] 
            flash[:message] = @student.errors.full_messages

            return redirect_to "/dojos/#{params[:dojo_id]}/students/new"
        
        else
            flash[:success] ="Successfully created" 
            return redirect_to "/dojos/#{params[:dojo_id]}"
            
        end

            
    end

    def show
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:student_id])
        @students = Student.where("id != ? AND dojo_id = ? AND DATE(created_at)=?", @student.id, @dojo.id,  @student.created_at.strftime("%Y-%m-%d"))

        return render 'students/student.html.erb'
    end

    def edit
        flash[:message] ||= []
        @dojo = Dojo.find(params[:dojo_id])
        @dojos = Dojo.all
        @student = Student.find(params[:student_id])
        return render 'students/edit.html.erb'
    end

    def update
    @student = Student.update(params[:student_id], student_params)

        if  @student.errors.full_messages != [] 
            flash[:message] = @student.errors.full_messages
            return redirect_to "/dojos/#{params[:dojo_id]}/students/#{params[:student_id]}/edit"
        
        else
        # flash[:success] ="Successfully created" 
            return redirect_to "/dojos/#{student_params[:dojo_id]}/students/#{params[:student_id]}"
        end

    end

    def destroy
        Student.find(params[:student_id]).destroy
        return redirect_to "/dojos/#{params[:dojo_id]}"

     end

    private
        def student_params
            params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
        end

end
