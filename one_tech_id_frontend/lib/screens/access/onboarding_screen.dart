import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/widgets/buttons/onboard_buttons.dart';
import '../../shared/widgets/cards/onboard_cards/onboard_card.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: !isLastPage
                ? OnBoardButton(
                    onClick: () => pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease),
                    label: const Row(children: [
                      Text("Pular",
                          style: TextStyle(
                              fontSize: 16,
                              color: IdColors.unselectedconColor)),
                      Icon(Icons.double_arrow_outlined,
                          color: IdColors.unselectedconColor)
                    ]),
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(
            child: SizedBox(
                child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 15, left: 16, right: 16, top: 40),
              child: PageView(
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                controller: pageController,
                children: const [
                  OnBoardCard(
                      lastPage: false,
                      imageHeader: "assets/images/cloud_data_protection.jpeg",
                      title: "Proteja seus dados",
                      description:
                          "A governança de dados é tudo o que você faz para garantir que os dados sejam seguros, privados, precisos, disponíveis e utilizáveis. Isso inclui as ações que as pessoas devem realizar, os processos que devem seguir e a tecnologia que oferece suporte durante todo o ciclo de vida dos dados."),
                  OnBoardCard(
                    lastPage: false,
                    imageHeader: "assets/images/risk_management.jpg",
                    title: "Gerencie riscos com mais facilidade.",
                    description:
                        "Com uma governança forte, você elimina as preocupações sobre a exposição de dados confidenciais a indivíduos ou sistemas que não têm a autorização adequada, a violações de segurança de usuários externos mal-intencionados ou mesmo a usuários internos que acessam dados que direito de ver. ",
                  ),
                  OnBoardCard(
                    lastPage: true,
                    imageHeader: "assets/images/image_page_one_onboard.png",
                    title: "Administre seus Dados.",
                    description:
                        "Governança de dados muitas vezes significa conceder ao  \"administrador dos dados\" a responsabilidade pelos próprios dados e pelos processos que garantem o uso adequado dos dados.",
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OnBoardButton(
                  onClick: () => pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn),
                  label: const Icon(Icons.arrow_back_outlined,
                      color: IdColors.unselectedconColor)),
              Center(
                child: SmoothPageIndicator(
                  effect: const WormEffect(
                      spacing: 16,
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: IdColors.selectedColor),
                  controller: pageController,
                  count: 3,
                  onDotClicked: (index) => pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn),
                ),
              ),
              OnBoardButton(
                  onClick: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn),
                  label: const Icon(
                    Icons.arrow_forward_outlined,
                    color: IdColors.unselectedconColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
