# 🚀 Manual do Utilizador: HAKiosk v3.4 (iNFOREIS 2026)

Bem-vindo à versão mais avançada do **HAKiosk**, a solução definitiva para transformar o teu tablet ou telemóvel num painel de controlo profissional para o Home Assistant.

---

## 1. 📦 Instalação e Configuração Inicial
1.  Copia o ficheiro `app-debug.apk` para o teu dispositivo.
2.  Instala e concede as permissões solicitadas:
    *   **Câmara**: Para deteção de movimento e leitura de QR Codes.
    *   **Notificações**: Para alertas remotos.
    *   **Otimização de Bateria**: Escolhe "Permitir" para que a app não seja encerrada pelo sistema.
3.  No ecrã inicial, clica em **Adicionar Perfil**.
4.  Dica: Se já tiveres o URL do servidor nas definições globais, clica no ícone de "Nuvem" no campo de URL para o preencher automaticamente.

---

## 2. 🖐️ Interface e Navegação
*   **Menu de Definições**: Clica no ícone de menu no **canto superior esquerdo** ou usa **dois dedos** e desliza de cima para baixo.
*   **Vigilância Rápida**: Clica no ícone de câmara no **canto superior direito** para ver os feeds das câmaras HA.
*   **Desligar a App**: Dentro das definições, usa o botão vermelho **Desligar Aplicação** para encerrar todos os processos.

---

## 3. 🚗 Android Auto (IoT no Carro)
1.  Vai a **Definições > Android Auto**.
2.  Clica em **Selecionar Portão** e escolhe a tua entidade `cover.` da lista.
3.  Clica em **Selecionar Fechaduras** e marca todas as portas que queres controlar no carro.
4.  No ecrã do carro, as portas aparecerão como botões de ação rápida. Podes também mudar o perfil do tablet de casa remotamente.

---

## 4. 🔐 Segurança e Biometria
1.  Define um **PIN de 4 dígitos** em **Definições > Vigilância**.
2.  Ativa a **Autenticação Biométrica** para usar a tua impressão digital ou rosto em vez do PIN.
3.  Sempre que tentares sair do modo Kiosk, o sensor biométrico será ativado automaticamente.

---

## 5. 🔄 Sincronização e Backup
*   **Sincronização Rápida (QR Code)**:
    *   **Exportar**: Em **Definições > Sincronização**, gera um código com toda a tua configuração.
    *   **Importar**: Num novo dispositivo, clica em **Importar** e aponta a câmara para o código do primeiro tablet.
*   **Cópia de Segurança (Ficheiro)**:
    *   **Guardar**: Podes guardar um ficheiro `.json` com todas as definições e perfis no armazenamento do dispositivo ou na nuvem.
    *   **Restaurar**: Seleciona um ficheiro de backup guardado anteriormente para repor todas as configurações instantaneamente.

---

## 6. 🌡️ Protetor de Ecrã e Dashlets
*   A app inclui um sistema de **Anti-Burn-in** que move o relógio suavemente para proteger ecrãs OLED.
*   **Dashlets**: Podes enviar dados do HA (temp, energia) para o screensaver via serviço `hakiosk.update_dashlet`.
*   **Filtro de Luz Azul**: Ativa em **Ecrã** para um tom âmbar automático durante o horário noturno.

---

## 7. 🤖 Integração Home Assistant (HACS)
Copia a pasta `ha_integration/custom_components/hakiosk` para o teu HA.
### Serviços Disponíveis:
*   `hakiosk.speak`: Faz o tablet falar uma mensagem.
*   `hakiosk.navigate`: Muda o dashboard exibido remotamente.
*   `hakiosk.update_dashlet`: Atualiza os mini-widgets do protetor de ecrã.
*   `hakiosk.cast`: Envia uma imagem/vídeo para sobrepor o ecrã temporariamente.

---

## 📡 Dados de Integração (Para referência rápida):
*   **Porta Local**: 2323
*   **Tópico MQTT**: `hakiosk/device/[ID]/...`
*   **ID do Dispositivo**: Ver no fundo do menu de Definições.

---
*Desenvolvido por iNFOREIS 2026 - A sua casa, o seu controlo.*
