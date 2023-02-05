puts "========== Agenda de Contatos =========="

@agenda = [
    {nome: "Messias", telefone: "(81) 98356-8584"},
    {nome: "Jose", telefone: "(81) 96584-8539"},
]

def todos_contatos()
    puts "Contatos:"
    puts "--------------------------"
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:telefone]}"
        puts "--------------------------"
    end
end

def adicionar_contato()
    print "Nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp

    @agenda.push({nome: nome, telefone: telefone})
end

def ver_contato()
    print "Qual nome você deseja: "
    nome = gets.chomp
    puts "--------------------------"

    @agenda.each do |contato|
        if contato[:nome].downcase == nome.downcase
            puts "#{contato[:nome]} - #{contato[:telefone]}"
            puts "--------------------------"
        end    
    end
end

def editar_contato()
    print "Qual nome deseja editar: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == nome.downcase
            print "Nome para editar (Se quiser manter o mesmo nome, aperte Enter). "
            nome_salvo = contato[:nome]

            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]
     
            print "Telefone para editar (Se quiser manter o mesmo telefone, aperte Enter). "
            telefone_salvo = contato[:telefone]

            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end       
    end
end

def remover_contato()
    print "Qual nome deseja remover: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == nome.downcase
            indice = @agenda.index(contato)
            @agenda.delete_at(indice)
            puts "--------------------------"
            break
        end
    end
end


loop do
puts "1. Contatos\n2. Adicionar Contatos\n3. Ver Contatos\n4. Editar Contatos\n5. Remover Contatos\n0. Sair\n"
puts
    print "Informe a opção: "    
    codigo = gets.chomp.to_i

    case
    when codigo == 0
        puts "Até mais!"
        break
    when codigo == 1
        todos_contatos()
    when codigo == 2
        adicionar_contato()
    when codigo == 3
        ver_contato()
    when codigo == 4
        editar_contato()
    when codigo == 5
        remover_contato()
    else
        puts "Função inexistente, por favor use uma função válida!"
        puts
    end
end