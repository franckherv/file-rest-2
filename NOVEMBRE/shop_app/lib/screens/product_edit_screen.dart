import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/model_chair.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductEditScreen extends StatefulWidget {
  static const routeName = "edit-screen";
  const ProductEditScreen({Key key}) : super(key: key);

  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile _imageFile;
  bool _initValue = true;
  var _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _articlefocus = FocusNode();
  final _prixfocusNode = FocusNode();
  final _descriptionfoncusNode = FocusNode();
  final _imagefocusNode = FocusNode();
  final _imageUrlController = TextEditingController();

  Map<String, String> _initialValue = {
    'name': '',
    'price': '',
    'description': '',
    'imageUrl': ''
  };

  var _editproduct =
      Chair(id: null, name: "", imageUrl: "", description: "", price: 0);

  @override
  void didChangeDependencies() {
    if (_initValue) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editproduct = Provider.of<ChairProvider>(context, listen: false)
            .findById(productId);
        _initialValue = {
          'name': _editproduct.name,
          'price': _editproduct.price.toString(),
          'description': _editproduct.description,
          'imageUrl': '',
        };
      }
      _imageUrlController.text = _editproduct.imageUrl;
    }
    _initValue = false;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _imageUrlController.addListener(_updateImage);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.removeListener(_updateImage);
    _prixfocusNode.dispose();
    _imagefocusNode.dispose();
    _articlefocus.dispose();
    _descriptionfoncusNode.dispose();
    super.dispose();
  }

  Future<void> _formSave() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    setState(() {
      _isLoading = true;
    });

    if (_editproduct.id != null) {
      Provider.of<ChairProvider>(context, listen: false)
          .updateProduct(_editproduct.id, _editproduct);
    } else {
      try {
        await Provider.of<ChairProvider>(context, listen: false)
            .addProduct(_editproduct);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (cxt) => AlertDialog(
            title: const Text('Désolé!'),
            content: const Text(
                'Une erreur est survenue lors de l\'ajout dans la boutique'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(cxt).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  void _updateImage() {
    if (!_imagefocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout de prouduit",
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFF98DDFF),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                _formSave();
              },
              icon: const Icon(Icons.save_alt))
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                        initialValue: _initialValue['name'],
                        decoration: const InputDecoration(labelText: 'Article'),
                        validator: (value) => value.trim().isEmpty
                            ? 'ce champ ne doit pas être vide'
                            : null,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_prixfocusNode);
                        },
                        onSaved: (value) {
                          _editproduct = Chair(
                              id: _editproduct.id,
                              isFavorite: _editproduct.isFavorite,
                              name: value,
                              imageUrl: _editproduct.imageUrl,
                              description: _editproduct.description,
                              price: _editproduct.price);
                        }),
                    TextFormField(
                        initialValue: _initialValue['price'],
                        decoration: const InputDecoration(labelText: 'Montant'),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        focusNode: _prixfocusNode,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "Ajouter le montant";
                          }
                          if (int.parse(value) <= 0) {
                            return "le prix de l'article doit être supérieur à 0 F";
                          }

                          if (int.tryParse(value) == null) {
                            return "Ce doit ne doit pas être vide";
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_descriptionfoncusNode);
                        },
                        onSaved: (value) {
                          _editproduct = Chair(
                              id: _editproduct.id,
                              isFavorite: _editproduct.isFavorite,
                              name: _editproduct.name,
                              imageUrl: _editproduct.imageUrl,
                              description: _editproduct.description,
                              price: int.parse(value.toString()));
                        }),
                    TextFormField(
                      initialValue: _initialValue['description'],
                      onSaved: (value) {
                        _editproduct = Chair(
                            id: _editproduct.id,
                            isFavorite: _editproduct.isFavorite,
                            name: _editproduct.name,
                            imageUrl: _editproduct.imageUrl,
                            description: value,
                            price: _editproduct.price);
                      },
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      maxLines: 3,
                      focusNode: _descriptionfoncusNode,
                      validator: (value) => value.trim().isEmpty
                          ? 'ce champ ne doit pas être vide'
                          : null,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_imagefocusNode);
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 8, right: 10),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )),
                          child: _imageUrlController.text.isEmpty
                              ? const Text("Image")
                              : Image.network(
                                  _imageUrlController.text,
                                  // fit: BoxFit.cover,
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                              onSaved: (value) {
                                _editproduct = Chair(
                                    id: _editproduct.id,
                                    isFavorite: _editproduct.isFavorite,
                                    name: _editproduct.name,
                                    imageUrl: value.toString(),
                                    description: _editproduct.description,
                                    price: _editproduct.price);
                              },
                              decoration: const InputDecoration(
                                  labelText:
                                      'Insérer le lien de l\'image du produit'),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              focusNode: _imagefocusNode,
                              controller: _imageUrlController,
                              validator: (value) {
                                if (!value.startsWith('https') &&
                                    !value.startsWith('http')) {
                                  return "Ouups!!! liens non correct";
                                }
                                if (!value.endsWith("jpg") &&
                                    !value.endsWith("jpeg") &&
                                    !value.endsWith("png")) {
                                  return "Format d'images incorrect";
                                }
                                return null;
                              }),
                        ),
                      ],
                    ),
                    imagePicker(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget imagePicker() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (_) => bottomSheet());
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 8, right: 10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                // shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: Colors.grey,
                ),
                image: DecorationImage(
                  image: _imageFile == null
                      ? const AssetImage("images/photo.jpg")
                      : FileImage(File(_imageFile.path)),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        const Expanded(child: Text("touchez la caméra pour ajouter une image"))
      ],
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedfile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedfile;
    });
  }

  Widget bottomSheet() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 110,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Choisissez une image"),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(
                    Icons.camera,
                    color: Color(0xFF4D62FF),
                  ),
                  label: const Text(
                    "Camera",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      takePhoto(ImageSource.gallery);
                    },
                    icon: const Icon(
                      Icons.photo_library,
                      color: Color(0xFF4D62FF),
                    ),
                    label: const Text(
                      "gallery",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
