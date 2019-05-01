#!/bin/bash
main()
{
    echo "Escolha uma opção."
    echo "1 - Buscar e atualizar repositórios"
    echo "2 - Limpar pacotes não usados com autoremove e autoclean"
    echo "3 - Esvaziar Lixeira"
    read opcao;
    case opcao in
    "1")
    atualizar_repositorios
    ;;
    "2")
    limpar_pacotes
    ;;
    "3")
    esvaziar_lixeira
    ;;
    esac
}
atualizar_repositorios()
{
    echo "Buscando e atualizando repositórios..."
    apt-get update && apt-get upgrade
    echo "Feito!"
}
limpar_pacotes()
{
    echo "Instalando aptitude e removendo pacotes não utilizados"
    apt-get install aptitude
    aptitude keep-all
    apt-get autoclean && apt-get autoremove
    echo "Feito!"
}
esvaziar_lixeira()
{
  echo "Esvaziando a lixeira..."
  path="${HOME}/.local/share/Trash/files"  
  cd "$path"
  for file in *
  do
  rm -rf "$file"
  done
  echo "Feito!"
}
main
