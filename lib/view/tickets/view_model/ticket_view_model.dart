import 'package:mobx/mobx.dart';
import 'package:ticket_try/view/tickets/model/ticket_model.dart';
import 'package:ticket_try/view/tickets/service/ticket_service.dart';
part 'ticket_view_model.g.dart';

class TicketViewModel = _TicketViewModelBase with _$TicketViewModel;

abstract class _TicketViewModelBase with Store {
  final TicketService ticketService;

  _TicketViewModelBase(this.ticketService);

  Future<TicketModel?> get getTicket async => await ticketService.getTicket;
}
