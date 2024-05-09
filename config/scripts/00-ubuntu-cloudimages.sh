#!/bin/bash

# URL do site que você quer acessar
url="https://cloud-images.ubuntu.com/"

# Faz a solicitação HTTP usando curl e extrai as opções de imagem e seus links correspondentes
options=()
while IFS= read -r line; do
    option=$(echo "$line" | sed -n 's/.*\(Ubuntu Server [^<]*\).*/\1/p')
    if [ -n "$option" ]; then
        options+=("$option")
    fi
done < <(curl -s "$url")

# Exibe a lista de opções de imagem selecionáveis
PS3="Selecione uma opção de imagem (ou 'q' para sair): "
select option in "${options[@]}"; do
    case "$REPLY" in
        [1-$((${#options[@]}))])
            # Extrai o primeiro nome dentro dos parênteses da opção selecionada e converte para minúsculas
            first_name=$(echo "$option" | grep -oP '\(([^)]+)\)' | head -n1 | sed 's/[(|)]//g' | awk '{print tolower($1)}')
            echo "Primeiro nome dentro dos parênteses: $first_name"
            url_img="https://cloud-images.ubuntu.com/${first_name}/current/${first_name}-server-cloudimg-amd64.img"
            wget -q --show-progress "$url_img" && mv "$(basename "$url_img")" /var/lib/vz/template/iso/
            ;;
        *)
            if [[ $REPLY == "q" ]]; then
                echo "Saindo..."
                break
            else
                echo "Opção inválida. Tente novamente."
            fi
            ;;
    esac
done
