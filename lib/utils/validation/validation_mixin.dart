mixin ValidationsMixin {
  String? validatedName(String? value) {
    if (value == null || value.isEmpty || value.length >= 52) {
      return 'Please enter valid name';
    } else {
      //name regex
      RegExp regex = RegExp(r'^[A-Za-z\ ]+$');
      if (!regex.hasMatch(value)) {
        return 'Name Should only contain alphabets';
      } else {
        return null;
      }
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else {
      // Email regex
      RegExp regex = RegExp(
          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'); // Basic email regex, you can adjust as per your requirements
      if (!regex.hasMatch(value)) {
        return 'Please enter a valid email address';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else {
      // Password regex: At least 8 characters, at least one uppercase letter, one lowercase letter, one number, and one special character
      RegExp regex = RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
      if (!regex.hasMatch(value)) {
        return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character';
      } else {
        return null;
      }
    }
  }

  String? validatePrice(String? value) {
    double coinPrice = double.parse(value.toString());
    if (coinPrice < 0.0 && coinPrice >= 100.0) {
      return 'the limit is assigned upto 100\$';
    }
    return null;
  }

  String? validatedBlogContent(String? value) {
    if (value == null || value.isEmpty || value.length <= 3) {
      return 'Please enter valid title';
    }
    return null;
  }
}
