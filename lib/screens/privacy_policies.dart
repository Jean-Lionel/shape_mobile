import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicies extends StatelessWidget {
  const PrivacyPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar( pinned: true,
            title: Text('Politique de confidentialité'),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Html(
                data: """<h1>Politique de confidentialité</h1>
<p>Cette politique de confidentialité décrit nos politiques et procédures sur la collecte, l'utilisation et la divulgation de vos informations lorsque vous utilisez le service et vous informe sur vos droits en matière de confidentialité et sur la manière dont la loi vous protège.</p>
<p>Nous utilisons vos données personnelles pour fournir et améliorer le service. En utilisant le Service, Vous acceptez la collecte et l'utilisation d'informations conformément à la présente Politique de confidentialité.</p>
<h1>Interprétation et définitions</h1>
<h2>Interprétation</h2>
<p>Les mots dont la lettre initiale est en majuscule ont des significations définies dans les conditions suivantes. Les définitions suivantes auront la même signification, qu'elles apparaissent au singulier ou au pluriel.</p>
<h2>Définitions</h2>
<p>Aux fins de la présente politique de confidentialité :</p>
<ul>
<li>
<p><strong>Compte</strong> désigne un compte unique créé pour vous permettre d'accéder à notre Service ou à des parties de notre Service.</p>
</li>
<li>
<p><strong>Affilié</strong> désigne une entité qui contrôle, est contrôlée par ou est sous contrôle commun avec une partie, où "contrôle" ; désigne la propriété de 50 % ou plus des actions, des participations ou d'autres titres habilités à voter pour l'élection des administrateurs ou d'une autre autorité de gestion.</p>
</li>
<li>
<p><strong>Application</strong> fait référence à Shapp, le logiciel fourni par la Société.</p>
</li>
<li>
<p><strong>Société</strong> (ci-après dénommée « la Société », « Nous », « Nous » ou « Notre » dans le présent Contrat) fait référence à Dewiya Tech, 16 Boulevard Sendwe, C /Kalamu.</p>
</li>
<li>
<p><strong>Pays</strong> fait référence à : Congo - Kinshasa</p>
</li>
<li>
<p><strong>Appareil</strong> désigne tout appareil pouvant accéder au Service tel qu'un ordinateur, un téléphone portable ou une tablette numérique.</p>
</li>
<li>
<p><strong>Les données personnelles</strong> sont toutes les informations relatives à une personne identifiée ou identifiable.</p>
</li>
<li>
<p><strong>Service</strong> fait référence à l'Application.</p>
</li>
<li>
<p><strong>Prestataire de services</strong> désigne toute personne physique ou morale qui traite les données pour le compte de la Société. Il fait référence à des sociétés tierces ou à des personnes employées par la Société pour faciliter le Service, pour fournir le Service au nom de la Société, pour effectuer des services liés au Service ou pour aider la Société à analyser la manière dont le Service est utilisé.</ p>
</li>
<li>
<p><strong>Données d'utilisation</strong> fait référence aux données collectées automatiquement, soit générées par l'utilisation du Service, soit à partir de l'infrastructure du Service elle-même (par exemple, la durée d'une visite de page).</p>
</li>
<li>
<p><strong>Vous</strong> désigne la personne accédant ou utilisant le Service, ou la société ou toute autre entité juridique au nom de laquelle cette personne accède ou utilise le Service, selon le cas.</p>
</li>
</ul>
<h1>Collecte et utilisation de vos données personnelles</h1>
<h2>Types de données collectées</h2>
<h3>Données personnelles</h3>
<p>Lorsque vous utilisez Notre Service, Nous pouvons Vous demander de Nous fournir certaines informations personnellement identifiables qui peuvent être utilisées pour Vous contacter ou Vous identifier. Les informations personnellement identifiables peuvent inclure, mais sans s'y limiter :</p>
<ul>
<li>
<p>Adresse e-mail</p>
</li>
<li>
<p>Prénom et nom</p>
</li>
<li>
<p>Numéro de téléphone</p>
</li>
<li>
<p>Données d'utilisation</p>
</li>
</ul>
<h3>Données d'utilisation</h3>
<p>Les données d'utilisation sont collectées automatiquement lors de l'utilisation du service.</p>
<p>Les données d'utilisation peuvent inclure des informations telles que l'adresse de protocole Internet de votre appareil (par exemple, l'adresse IP), le type de navigateur, la version du navigateur, les pages de notre service que vous visitez, l'heure et la date de votre visite, le temps passé sur ces pages , des identifiants d'appareil uniques et d'autres données de diagnostic.</p>
<p>Lorsque vous accédez au Service par ou via un appareil mobile, nous pouvons collecter certaines informations automatiquement, y compris, mais sans s'y limiter, le type d'appareil mobile que vous utilisez, l'identifiant unique de votre appareil mobile, l'adresse IP de votre appareil mobile , votre système d'exploitation mobile, le type de navigateur Internet mobile que vous utilisez, les identifiants uniques de l'appareil et d'autres données de diagnostic.</p>
<p>Nous pouvons également collecter des informations que votre navigateur envoie chaque fois que vous visitez notre service ou lorsque vous accédez au service par ou via un appareil mobile.</p>
<h3>Informations collectées lors de l'utilisation de l'application</h3>
<p>Lors de l'utilisation de Notre Application, afin de fournir des fonctionnalités de Notre Application, Nous pouvons collecter, avec Votre autorisation préalable :</p>
<ul>
<li>Images et autres informations de l'appareil photo et de la photothèque de votre appareil</li>
</ul>
<p>Nous utilisons ces informations pour fournir des fonctionnalités de Notre Service, pour améliorer et personnaliser Notre Service. Les informations peuvent être téléchargées sur les serveurs de la Société et/ou sur le serveur d'un fournisseur de services ou elles peuvent être simplement stockées sur votre appareil.</p>
<p>Vous pouvez activer ou désactiver l'accès à ces informations à tout moment, via les paramètres de votre appareil.</p>
<h2>Utilisation de vos données personnelles</h2>
<p>La Société peut utiliser les Données personnelles aux fins suivantes :</p>
<ul>
<li>
<p><strong>Pour fournir et maintenir notre Service</strong>, y compris pour surveiller l'utilisation de notre Service.</p>
</li>
<li>
<p><strong>Pour gérer Votre Compte :</strong> pour gérer Votre inscription en tant qu'utilisateur du Service. Les données personnelles que vous fournissez peuvent vous donner accès à différentes fonctionnalités du service qui sont à votre disposition en tant qu'utilisateur enregistré.</p>
</li>
<li>
<p><strong>Pour l'exécution d'un contrat :</strong> l'élaboration, le respect et l'exécution du contrat d'achat des produits, articles ou services que vous avez achetés ou de tout autre contrat avec nous via le service.</ p>
</li>
<li>
<p><strong>Pour vous contacter :</strong> pour vous contacter par e-mail, appels téléphoniques, SMS ou autres formes de communication électronique équivalentes, telles que les notifications push d'une application mobile concernant les mises à jour ou les communications informatives liées aux fonctionnalités, produits ou services sous-traités, y compris les mises à jour de sécurité, lorsque cela est nécessaire ou raisonnable pour leur mise en œuvre.</p>
</li>
<li>
<p><strong>Pour vous fournir</strong> des actualités, des offres spéciales et des informations générales sur d'autres biens, services et événements que nous proposons et qui sont similaires à ceux que vous avez déjà achetés ou sur lesquels vous vous êtes renseigné, sauf si vous avez choisi de ne pas le faire recevoir ces informations.</p>
</li>
<li>
<p><strong>Pour gérer Vos demandes :</strong> Pour nous assister et gérer Vos demandes.</p>
</li>
<li>
<p><strong>Pour les transferts d'entreprise :</strong> Nous pouvons utiliser Vos informations pour évaluer ou mener une fusion, une cession, une restructuration, une réorganisation, une dissolution ou toute autre vente ou transfert de tout ou partie de Nos actifs, que ce soit en tant que en cours d'exploitation ou dans le cadre d'une faillite, d'une liquidation ou d'une procédure similaire, dans laquelle les données personnelles que nous détenons sur les utilisateurs de nos services font partie des actifs transférés.</p>
</li>
<li>
<p><strong>À d'autres fins</strong> : nous pouvons utiliser vos informations à d'autres fins, telles que l'analyse de données, l'identification des tendances d'utilisation, la détermination de l'efficacité de nos campagnes promotionnelles et pour évaluer et améliorer notre service, nos produits, nos services , le marketing et votre expérience.</p>
</li>
</ul>
<p>Nous pouvons partager vos informations personnelles dans les situations suivantes :</p>
<ul>
<li><strong>Avec les fournisseurs de services :</strong> nous pouvons partager vos informations personnelles avec les fournisseurs de services pour surveiller et analyser l'utilisation de notre service, pour vous contacter.</li>
<li><strong>Pour les transferts d'entreprise :</strong> Nous pouvons partager ou transférer Vos informations personnelles dans le cadre de, ou pendant les négociations de, toute fusion, vente d'actifs de la Société, financement ou acquisition de tout ou partie de Notre entreprise à une autre société.</li>
<li><strong>Avec les affiliés :</strong> nous pouvons partager vos informations avec nos affiliés, auquel cas nous exigerons de ces affiliés qu'ils respectent la présente politique de confidentialité. Les sociétés affiliées incluent notre société mère et toutes autres filiales, partenaires de coentreprise ou autres sociétés que nous contrôlons ou qui sont sous contrôle commun avec nous.</li>
<li><strong>Avec des partenaires commerciaux :</strong> nous pouvons partager vos informations avec nos partenaires commerciaux pour vous proposer certains produits, services ou promotions.</li>
<li><strong>Avec d'autres utilisateurs :</strong> lorsque vous partagez des informations personnelles ou interagissez d'une autre manière dans les zones publiques avec d'autres utilisateurs, ces informations peuvent être vues par tous les utilisateurs et peuvent être diffusées publiquement à l'extérieur.</li>
<li><strong>Avec Votre consentement</strong> : Nous pouvons divulguer Vos informations personnelles à toute autre fin avec Votre consentement.</li>
</ul>
<h2>Conservation de vos données personnelles</h2>
<p>La Société ne conservera vos données personnelles que le temps nécessaire aux fins énoncées dans la présente politique de confidentialité. Nous conserverons et utiliserons vos données personnelles dans la mesure nécessaire pour nous conformer à nos obligations légales (par exemple, si nous sommes tenus de conserver vos données pour nous conformer aux lois applicables), résoudre les litiges et appliquer nos accords et politiques juridiques.</ p>
<p>La Société conservera également les Données d'utilisation à des fins d'analyse interne. Les données d'utilisation sont généralement conservées pendant une période plus courte, sauf lorsque ces données sont utilisées pour renforcer la sécurité ou pour améliorer la fonctionnalité de notre service, ou lorsque nous sommes légalement tenus de conserver ces données pendant des périodes plus longues.</p>
<h2>Transfert de vos données personnelles</h2>
<p>Vos informations, y compris les données personnelles, sont traitées dans les bureaux d'exploitation de la société et dans tout autre lieu où se trouvent les parties impliquées dans le traitement. Cela signifie que ces informations peuvent être transférées et conservées sur des ordinateurs situés en dehors de votre état, province, pays ou autre juridiction gouvernementale où les lois sur la protection des données peuvent différer de celles de votre juridiction.</p>
<p>Votre consentement à cette politique de confidentialité suivi de votre soumission de ces informations représente votre accord à ce transfert.</p>
<p>La Société prendra toutes les mesures raisonnablement nécessaires pour s'assurer que Vos données sont traitées en toute sécurité et conformément à la présente Politique de confidentialité et aucun transfert de Vos Données personnelles n'aura lieu vers une organisation ou un pays à moins que des contrôles adéquats ne soient en place, y compris la sécurité de vos données et autres informations personnelles.</p>
<h2>Supprimer vos données personnelles</h2>
<p>Vous avez le droit de supprimer ou de demander que nous vous aidions à supprimer les données personnelles que nous avons collectées à votre sujet.</p>
<p>Notre service peut vous donner la possibilité de supprimer certaines informations vous concernant depuis le service.</p>
<p>Vous pouvez mettre à jour, modifier ou supprimer vos informations à tout moment en vous connectant à votre compte, si vous en avez un, et en visitant la section des paramètres du compte qui vous permet de gérer vos informations personnelles. Vous pouvez également nous contacter pour demander l'accès, la correction ou la suppression de toute information personnelle que vous nous avez fournie.</p>
<p>Veuillez noter, cependant, que nous pouvons avoir besoin de conserver certaines informations lorsque nous avons une obligation légale ou une base légale pour le faire.</p>
<h2>Divulgation de vos données personnelles</h2>
<h3>Transactions commerciales</h3>
<p>Si la Société est impliquée dans une fusion, une acquisition ou une vente d'actifs, vos données personnelles peuvent être transférées. Nous vous informerons avant que vos données personnelles ne soient transférées et soumises à une politique de confidentialité différente.</p>
<h3>Application de la loi</h3>
<p>Dans certaines circonstances, la Société peut être tenue de divulguer vos données personnelles si la loi l'exige ou en réponse à des demandes valables d'autorités publiques (par exemple, un tribunal ou une agence gouvernementale).</p>
<h3>Autres exigences légales</h3>
<p>La Société peut divulguer Vos Données Personnelles en croyant de bonne foi qu'une telle action est nécessaire pour :</p>
<ul>
<li>Se conformer à une obligation légale</li>
<li>Protéger et défendre les droits ou la propriété de la Société</li>
<li>Prévenir ou enquêter sur d'éventuels actes répréhensibles en rapport avec le Service</li>
<li>Protéger la sécurité personnelle des Utilisateurs du Service ou du public</li>
<li>Protection contre la responsabilité légale</li>
</ul>
<h2>Sécurité de vos données personnelles</h2>
<p>La sécurité de vos données personnelles est importante pour nous, mais n'oubliez pas qu'aucune méthode de transmission sur Internet ou méthode de stockage électronique n'est sécurisée à 100 %. Bien que nous nous efforcions d'utiliser des moyens commercialement acceptables pour protéger vos données personnelles, nous ne pouvons garantir leur sécurité absolue.</p>
<h1>Confidentialité des enfants</h1>
<p>Notre service ne s'adresse pas aux personnes de moins de 13 ans. Nous ne collectons pas sciemment d'informations personnellement identifiables auprès de personnes de moins de 13 ans. Si vous êtes un parent ou un tuteur et que vous savez que votre enfant nous a fourni des informations personnelles. Données, veuillez nous contacter. Si nous apprenons que nous avons collecté des données personnelles auprès d'une personne de moins de 13 ans sans vérification du consentement parental, nous prenons des mesures pour supprimer ces informations de nos serveurs.</p>
<p>Si nous devons compter sur le consentement comme base légale pour le traitement de vos informations et que votre pays exige le consentement d'un parent, nous pouvons exiger le consentement de votre parent avant de collecter et d'utiliser ces informations.</p>
<h1>Liens vers d'autres sites Web</h1>
<p>Notre Service peut contenir des liens vers d'autres sites Web qui ne sont pas exploités par Nous. Si vous cliquez sur un lien tiers, vous serez dirigé vers le site de ce tiers. Nous vous conseillons vivement de consulter la politique de confidentialité de chaque site que vous visitez.</p>
<p>Nous n'avons aucun contrôle et n'assumons aucune responsabilité quant au contenu, aux politiques de confidentialité ou aux pratiques des sites ou services tiers.</p>
<h1>Modifications de cette politique de confidentialité</h1>
<p>Nous pouvons mettre à jour notre politique de confidentialité de temps à autre. Nous vous informerons de tout changement en publiant la nouvelle politique de confidentialité sur cette page.</p>
<p>Nous vous informerons par e-mail et/ou par un avis visible sur notre service, avant que le changement ne devienne effectif et mettrons à jour la &quot;Dernière mise à jour&quot; date en haut de cette politique de confidentialité.</p>
<p>Il vous est conseillé de consulter régulièrement cette politique de confidentialité pour tout changement. Les modifications apportées à cette politique de confidentialité entrent en vigueur lorsqu'elles sont publiées sur cette page.</p>
<h1>Contactez-nous</h1>
<p>Si vous avez des questions sur cette politique de confidentialité, vous pouvez nous contacter :</p>
<ul>
  <li>
  <p>Par e-mail : info-shapp@dewiya.online</p>
  </li>
  <li>
  <p>En visitant cette page sur notre site : <a href="https://shapp.dewiya.online" rel="external nofollow noopener" target="_blank">https://shapp.dewiya.online</ a></p>
  </li>
  <li>
  <p>Par numéro de téléphone : +1 689 267 4454</p>
  </li>
</ul>
""",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
