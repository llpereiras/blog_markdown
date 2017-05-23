# Blog em markdown

Este projeto, é um blog que o autor optou, após ser hackeado, 

em inserir os textos dos posts em formato

Markdown(https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet),


# Instalação

#### Efetue o clone deste projeto
```
git clone https://github.com/llpereiras/blog_markdown
```

#### Efetue a instalação das dependências
```
bundle install
```

#### Efetue a criação do banco de dados
```
rails db:create
rails db:migrate
```

#### Efetue a do usuario Admin
```
rails db:seed
```

#Execução do sidekiq

Este projeto utiliza a gem sidekiq que é responsável por executar as tarefas em background.

Para que o sidekiq funcione é necessário que o serviço esteja sendo executado.

Para iniciar o serviço do sidekiq execute
```
sidekiq &
```

Para para o processo do sidekiq, execute:
```
sidekiq &
```

Para excluir todos os processos que estão na fila do sidekiq, execute
```
rails sidekiq:clear_all_jobs
```

Para parar a execução do sidekiq execute:
```
kill $(ps aux | grep sidekiq | awk '{print $2}')
```

# Execução do servidor da aplicação

Após deixar o sidekiq em execução, é possível executar o servidor da aplicação.
 
```
rails s 
```

Para ver a aplicação em funcionamento, acesse **http://localhost:3000**

Para obter acesso de administrador, utilize as seguintes credenciais

**Login :** llpereiras@gmail.com

**Password :** 123456789


# TODO

  * Inserir ferramenta para facilitar digitação em format markdown(https://github.com/llpereiras/blog_markdown/issues/15)
  * Criar administração de usuários


