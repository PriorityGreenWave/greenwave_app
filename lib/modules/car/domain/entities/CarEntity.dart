class CarEntity {
  final int idUsuario;
  final String placa;
  final String rfid;
  final String fabricante;
  final String modelo;
  final BigInt ano;
  final String tipoVeiculo;
  final bool veiculoEmergencia;
  final bool estadoEmergencia;

  const CarEntity({
    this.idUsuario,
    this.placa,
    this.rfid,
    this.fabricante,
    this.modelo,
    this.ano,
    this.tipoVeiculo,
    this.veiculoEmergencia,
    this.estadoEmergencia,
  });

  Map<String, dynamic> toMap() {
    return {
      'idVeiculo': idUsuario,
      'placa': placa,
      'rfid': rfid,
      'fabricante': fabricante,
      'modelo': modelo,
      'ano': ano,
      'tipoVeiculo': tipoVeiculo,
      'veiculoEmergencia': veiculoEmergencia,
      'estadoEmergencia': estadoEmergencia,
    };
  }
}
