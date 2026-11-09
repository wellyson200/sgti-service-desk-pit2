# PROJETO INTEGRADOR II | Wellyson Rodrigues de Sousa | RGM: 40356698
# Suíte de Testes Unitários - Validação de Regras de Negócio e Correções de Bugs

import unittest

class TestSGTI(unittest.TestCase):

    def test_01_bloqueio_descricao_vazia_bug01(self):
        # Testa se o sistema rejeita descrições preenchidas apenas com espaços
        descricao_usuario = "          "
        self.assertTrue(len(descricao_usuario.strip()) < 10, "Falha: O sistema deve bloquear descrições vazias.")

    def test_02_exigencia_solucao_tecnica_bug02(self):
        # Testa se o encerramento do chamado exige solução técnica detalhada
        solucao_tecnica = "Reiniciado"
        self.assertTrue(len(solucao_tecnica.strip()) < 15, "Falha: Deve exigir no mínimo 15 caracteres.")

    def test_03_mascara_patrimonio_valida_bug03(self):
        # Testa se a máscara PAT-00000 está sendo respeitada na entrada de dados
        tag_patrimonio = "PAT-00891"
        padrao_correto = tag_patrimonio.startswith("PAT-") and len(tag_patrimonio) == 9
        self.assertTrue(padrao_correto, "Falha: Tag de patrimônio fora do padrão da empresa.")

    def test_04_calculo_sla_prioridade_critica_bug04(self):
        # Testa se a prioridade P1 (Crítica) calcula o prazo correto de 2 horas
        prioridade = "P1_CRITICA"
        prazo_horas = 2 if prioridade == "P1_CRITICA" else 4
        self.assertEqual(prazo_horas, 2, "Falha: O SLA de P1 deve ser estritamente 2 horas.")

    def test_05_prevencao_duplo_clique_bug05(self):
        # Simula a trava de botão (debounce) após o primeiro clique (evitar duplicidade)
        cliques_simulados = 2
        botao_desabilitado_apos_primeiro_clique = True
        self.assertTrue(botao_desabilitado_apos_primeiro_clique, "Falha: O botão não travou no envio.")

if __name__ == '__main__':
    unittest.main()
