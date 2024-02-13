## Backup 

Para backup e recuperação de dados em um cluster Kubernetes bare metal, você pode considerar várias soluções. Duas opções populares são Velero (anteriormente conhecido como Heptio Ark) e Kasten K10. Vou dar uma visão geral de ambas:

## 1. Velero (anteriormente Heptio Ark):

  - Velero é uma ferramenta de backup e recuperação de recursos do Kubernetes e volumes persistentes.
  - Ele permite que você crie backups programados ou sob demanda de recursos específicos ou de todo o cluster.
  - Velero suporta backups incrementais para economizar tempo e armazenamento.
  - Ele oferece integração com vários provedores de armazenamento em nuvem para armazenar - backups de forma segura, mas também pode ser configurado para armazenar localmente.
  - Velero facilita a migração entre clusters e a recuperação de desastres.

## 2. Kasten K10:

  - Kasten K10 é uma plataforma de proteção de dados Kubernetes que oferece recursos avançados de backup, recuperação e mobilidade de dados.
  - Ele suporta backup de aplicativos inteiros, incluindo configurações, dados de aplicativos e volumes persistentes.
  - K10 permite políticas de retenção personalizáveis para gerenciar o ciclo de vida dos backups.
  - Ele oferece uma interface de usuário intuitiva e integrada ao Kubernetes para gerenciar backups e recuperações.
  - Kasten K10 também fornece funcionalidades avançadas, como replicação de dados entre clusters Kubernetes e migração de aplicativos.

  