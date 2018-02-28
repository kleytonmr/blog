class UsersController < ApplicationController
  # Nesse momento, o Rails cria a rota (route) e a view para a ação new, requisitada durante a
  # criação do controller, também conhecida como sign up.
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "Usuário foi criado com sucesso!"
      #tire o método de comentário quando criar o helper.
      #Usuário depois de cadastrar-se acessa o sistema automaticamente
      #sign_in(@user)
    else
      render action: :new
    end
  end

  # É necessario fazer para evitar redundância e para da permissões.
  # No Rails 4, começou a ser implementado o Strong parameters, onde são especificados
  # os parâmetros requeridos e permitidos, evitando a atribuição em massa.
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
